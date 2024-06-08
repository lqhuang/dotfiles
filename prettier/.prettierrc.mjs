// https://prettier.io/docs/en/options
// https://prettier.io/docs/en/configuration

/** @type {import('prettier').Config} */
const config = {
  tabWidth: 2,
  trailingComma: "all",
  semi: false,
  singleQuote: true,
  quoteProps: "as-needed",
  bracketSpacing: true,
  bracketSameLine: false,
  arrowParens: "avoid",
  proseWrap: "preserve",
  embeddedLanguageFormatting: "auto",
  singleAttributePerLine: false,
  plugins: ["prettier-plugin-tailwindcss"],
};

export default config;
