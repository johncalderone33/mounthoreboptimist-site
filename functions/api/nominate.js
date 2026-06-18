const DESTINATION = 'sysk@mounthoreboptimist.com';
const FROM_ADDRESS = 'SYSK Nominations <nominations@mounthoreboptimist.com>';
const THANKS_PATH = '/someone-you-should-know/nominate/thanks';
const FORM_PATH = '/someone-you-should-know/nominate';

const stripNewlines = (s) => String(s ?? '').replace(/[\r\n]+/g, ' ').trim();
const clamp = (s, n) => (s.length > n ? s.slice(0, n) : s);
const safeHeader = (s) => clamp(stripNewlines(s), 200);

export async function onRequestPost(context) {
  let form;
  try {
    form = await context.request.formData();
  } catch {
    return Response.redirect(new URL(`${FORM_PATH}?error=1`, context.request.url).toString(), 303);
  }

  // Honeypot — bots fill this, humans never see it.
  if (form.get('company')) {
    return Response.redirect(new URL(THANKS_PATH, context.request.url).toString(), 303);
  }

  const nominatorName = stripNewlines(form.get('nominator_name'));
  const nominatorEmail = stripNewlines(form.get('nominator_email'));
  const nominatorPhone = stripNewlines(form.get('nominator_phone'));
  const nomineeName = stripNewlines(form.get('nominee_name'));
  const nomineeAbout = clamp(String(form.get('nominee_about') ?? '').trim(), 4000);

  if (!nominatorName || !nominatorEmail || !nomineeName || !nomineeAbout) {
    return Response.redirect(new URL(`${FORM_PATH}?error=missing`, context.request.url).toString(), 303);
  }

  const apiKey = context.env.RESEND_API_KEY;
  if (!apiKey) {
    console.error('RESEND_API_KEY not set');
    return Response.redirect(new URL(`${FORM_PATH}?error=config`, context.request.url).toString(), 303);
  }

  const text =
    `New "Someone You Should Know" nomination submitted via mounthoreboptimist.com\n\n` +
    `Nominee\n-------\n${nomineeName}\n\n` +
    `Why this nominee\n----------------\n${nomineeAbout}\n\n` +
    `Nominator\n---------\n` +
    `Name:  ${nominatorName}\n` +
    `Email: ${nominatorEmail}\n` +
    `Phone: ${nominatorPhone || '(not provided)'}\n`;

  try {
    const res = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${apiKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        from: FROM_ADDRESS,
        to: [DESTINATION],
        reply_to: safeHeader(`${nominatorName} <${nominatorEmail}>`),
        subject: safeHeader(`SYSK Nomination — ${nomineeName}`),
        text,
      }),
    });

    if (!res.ok) {
      const errBody = await res.text();
      console.error('Resend error', res.status, errBody);
      return Response.redirect(new URL(`${FORM_PATH}?error=send`, context.request.url).toString(), 303);
    }
  } catch (err) {
    console.error('SYSK nomination send failed:', err);
    return Response.redirect(new URL(`${FORM_PATH}?error=send`, context.request.url).toString(), 303);
  }

  return Response.redirect(new URL(THANKS_PATH, context.request.url).toString(), 303);
}
