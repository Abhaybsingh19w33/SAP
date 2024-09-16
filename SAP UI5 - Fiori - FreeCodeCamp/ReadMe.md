[SAP UI5 / Fiori - Full Course - FreeCodeCamp](https://www.youtube.com/watch?v=C9cK2Z2JDLg&ab_channel=freeCodeCamp.org)
- [Github](https://github.com/brandoncaulfield/sap-ui5-walkthrough/commits/main/)
- [Installing the UI5 CLI](https://sap.github.io/ui5-tooling/stable/pages/GettingStarted/)

## Order Executes an SAPUI5 Application
- https://inui.io/sapui5-application-execution-order/
- https://inui.io/sapui5-controller-life-cycle/
- https://inui.io/sapui5-control-life-cycle/

The Execution Order of an SAPUI5 Application
Below is the order in which SAPUI5 applications execute. The application files of the respective execution step are in braces:

- Start of the application (index.html)
- Load SAPUI5 resources
- Index’s bootstrap loads component (component.js)
- Component loads descriptor (manifest.json)
- Component creates models defined in the descriptor
- Execute component’s init function
- Component’s init function executes parent UIComponent’s init function
- Parent UIComponent’s init function creates manifest’s router
- Parent UIComponent’s init function creates manifest’s root view (view1.view.xml)
- Root view creates root control
- Component’s init function initializes router
- Router creates other necessary views
- Each view loads corresponding controller (view1.controller.js)
- Each controller executes its init function
- Router places views in root control
- Models are available in the views
- Evaluate view’s bindings
- Retrieve model data

## Manifest Json

Moving the configuration to the manifest file