return {
  settings = {
    pyright = {
      disableLanguageServices = true,
      disableOrganizeImports = true
    },
    python = {
      analysis = {
        --[[ typeCheckingMode = "off", ]]
        useLibraryCodeForTypes = true,
        --[[ diagnosticMode = 'openFilesOnly', ]]
      },
    },
  },
}
