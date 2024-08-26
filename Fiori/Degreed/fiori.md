![alt text](image.png)

![alt text](image-1.png)

[OData fundamentals](https://developers.sap.com/tutorials/odata-01-intro-origins.html)

[Odata V2 vs V4](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/9f5f060351034d98990213d077dab38a/eb5d246dc27046eba4d14b7b73e74a88.html)

[OData V4](https://help.sap.com/docs/SAP_SUCCESSFACTORS_PLATFORM/9f5f060351034d98990213d077dab38a/ae14ca05a11e4b708b6145447c1e9827.html)

[URI Conventions (OData Version 2.0)](https://www.odata.org/documentation/odata-version-2-0/uri-conventions/)

[ES5 Registerations link](https://register.sapdevcenter.com/SUPSignForms/) 
-->[Demo](https://developers.sap.com/tutorials/gateway-demo-signup.html)

[ES5 login](https://sapes5.sapdevcenter.com/sap/bc/gui/sap/its/webgui)

# Destination Configuration

[create destination in BTP](https://developers.sap.com/tutorials/cp-portal-cloud-foundry-gateway-connection..html)

![alt text](image-2.png)

![alt text](image-3.png)

|:-:|:-:|
|:-:|:-:|
|Name| ES5|
|Type| HTTP |
|Description| SAP Gateway ES5
|URL| https://sapes5.sapdevcenter.com
|Proxy Type|Internet
Authentication|BasicAuthentication

## Additional Properties

|:-:|:-:|
|:-:|:-:|
|HTML5.DynamicDestination|true
|sap-client|002|
|sap-platform|ABAP
|WebIDEEnabled|true
|WebIDESystem|Gateway
|WebIDEUsage|odata_abap, dev_abap

![alt text](image-5.png)

# Project setup 
![alt text](image-4.png)

- This will take care of routing part

![alt text](image-6.png)
- Managed Approuter - the SAP will take care of routing
- after this sapui5demo folder has been generated, move to that folder

![alt text](image-7.png)
- take url from this

![alt text](image-8.png)

![alt text](image-15.png)

![alt text](image-9.png)

![alt text](image-10.png)

![alt text](image-11.png)

![alt text](image-12.png)

![alt text](image-13.png)

To manage the git in parent folder git.openRepositoryInParentFolders 
![alt text](image-14.png)


https://port8080-workspaces-ws-j9crb.us10.trial.applicationstudio.cloud.sap/test/flpSandbox.html?sap-client=002&sap-ui-xx-viewCache=false#nsproducts-display

create a list and bind the /ProductSet
![alt text](image-16.png)

bind name to the list title
![alt text](image-18.png)
![alt text](image-17.png)

build the mta
![alt text](image-19.png)
build will be created in mta_archives
![alt text](image-20.png)

api endpoint link from cloudfoundry env
![alt text](image-21.png)

to deploy the mta archive
in console write 
```
cf login

enter the email and password

cf api <api link from clound foundry>
```

then right click on the tar file and click on deploy button

![alt text](image-22.png)

or in vs code to deply the last part 
![alt text](image-23.png)

to get the business partner link, through this we can access the app live
![alt text](image-24.png)

extend the work zone

open the work zone
![alt text](image-25.png)

update the content channel
![alt text](image-26.png)

go to content manager -> content explorer
![alt text](image-27.png)

add the apps to the sub account
![alt text](image-28.png)

now adding the app to the group 
![alt text](image-29.png)

then add the app for everyoe role
![alt text](image-30.png)

in site directory, create a site
![alt text](image-31.png)

then go the launchpad via the link on site tile
![alt text](image-32.png)

![alt text](image-33.png)


Connecting on premise system to the BAS via cloud connector
![alt text](image-34.png)
![alt text](image-35.png)

Binding Types
![alt text](image-36.png)

![alt text](image-37.png)

Northwind Service

https://services.odata.org/

![alt text](image-38.png)

Fragments - do not contain there controller of its own.
![alt text](image-39.png)

```
<core:FragmentDefinition xmlns="sap.m" xmlns:core="sap.ui.core">
    <Dialog id="helloDialog" title="Hello">
        <content>
            <core:Icon id="_IDGenIcon1" src="sap-icon://hello-world" size="8rem" class="sapUiMediumMargin" />
        </content>

        <beginButton>
            <Button id="_IDGenButton1" text="ok" press=".onCloseDialog" />
        </beginButton>
    </Dialog>
</core:FragmentDefinition>
```

