import antfu from '@antfu/eslint-config'

export default antfu({
  // Enable YAML support
  yaml: {
    overrides: {
      // For Helm values files, allow flexible string styles
      'yaml/quotes': ['error', { prefer: 'single', avoidEscape: true }],
      // 'yaml/plain-scalar': 'off',
    },
  },
  // Disable other language support we don't need
  typescript: false,
  vue: false,
  react: false,
  svelte: false,
  astro: false,
  // Enable stylistic formatting
  stylistic: {
    indent: 2,
    quotes: 'single',
    semi: false,
  },
  // Files to ignore
  ignores: [
    '**/node_modules/**',
    '**/.git/**',
  ],
}, {
  // Disable sort keys rule for JSON files
  files: ['**/package.json'],
  rules: {
    'jsonc/sort-keys': 'off',
  },
})
