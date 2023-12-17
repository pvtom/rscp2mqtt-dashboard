/**
 * For more information about individual settings, refer to the documentation:
 *    https://nodered.org/docs/user-guide/runtime/configuration
 **/

module.exports = {
flowFile: 'flows.json',
credentialSecret: false,
flowFilePretty: true,
uiPort: process.env.PORT || 1880,
diagnostics: {
    enabled: true,
    ui: true,
},
runtimeState: {
    enabled: false,
    ui: false,
},
logging: {
    console: {
        level: "info",
        metrics: false,
        audit: false
    }
},
exportGlobalContextKeys: false,
externalModules: {
},
editorTheme: {
    palette: {
    },
    projects: {
        enabled: false,
        workflow: {
            mode: "manual"
        }
    },
    codeEditor: {
        lib: "monaco",
        options: {
        }
    },
    markdownEditor: {
        mermaid: {
            enabled: true
        }
    },
},
functionTimeout: 0,
functionGlobalContext: {
},
debugMaxLength: 1000,
mqttReconnectTime: 15000,
serialReconnectTime: 15000,
}
