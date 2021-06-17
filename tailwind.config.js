const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  purge: {
    content: ["layouts/**/*.html"],
    options: {
      safelist: {
        deep: [/-600$/],
      }
    }
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
      require('@tailwindcss/typography'),
  ],
}
