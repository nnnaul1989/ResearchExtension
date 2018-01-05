# Submit PlayStore Document
	Version 1.0.0
	Last Update : January, 06, 2018

##Table Content

1. [Create Signed APK](#create_signed_apk)
	* 1.1. [Create keystore](#1_1_create_keystore)  
	* 1.2. [Update version code](#1_2_update_version_code)  
	* 1.3. [Build apk](#1_3_build_apk)
2. [Create App on PlayStore](#create_app_on_playstore)
	* 2.1. [Create Developer Google Account](#2_1_create_developer_account)
	* 2.2. [Create New App](#2_2_create_new_app)

## <a name='create_signed_apk'></a>1. Create Signed APK
**<a name='1_1_create_keystore'></a>1.1 Create keystore :**
create keystore by Android Studio
![image_keystore](https://i.imgur.com/gBgYsax.png)

Fill Password/Confirm, First and Last Name fields as above image.

**<a name='1_2_update_version_code'></a>1.2 Update version code :**

With every build that submit to playstore, have to update version code for build. Increase +1 for every build.

Update in file **AndroidManifest.xml**
![image_update_version_code](https://i.imgur.com/DfDCcLe.png)

**<a name='1_3_build_apk'></a>1.3 Build apk :**

Follow to below images

![image_1](https://i.imgur.com/UHrVMhL.png)
![image_2](https://i.imgur.com/sOCnVP0.png)

Point to keystore path and next then
![image_3](https://i.imgur.com/gJt9G0g.png)

Choose build type is **release**, check box **V1** and **V2**, then click **Finish**.
![image_4](https://i.imgur.com/2vk9GDi.png)

The build is saved in **app/release/app-release.apk**

## <a name='create_app_on_playstore'></a>2. Create App on PlayStore

**<a name='2_1_create_developer_account'></a>2.1. Create Developer Google Account :**
Go to [play google](https://play.google.com/apps/publish/signup/) to create developer account with charge 25$.

**<a name='2_2_create_new_app'></a>2.2. Create New App :**

Click **Create Application** on tab **All application**, set app name in **Title** field.
![img_create_new_app](https://i.imgur.com/xHO3nPb.png)

**<a name='2_3_config_app'></a>2.3. Config app :**

`- Store listing:` upload some screenshots in app, app icon, update description,...
![img_store_listing_1](https://i.imgur.com/CVRpVZA.png)
![img_store_listing_2](https://i.imgur.com/lJnxmYq.png)
Icon needs size **512x512**, Feature Graphic needs size **1024(w)x500(h)**.

Set type for categorization
![img_store_listing_3](https://i.imgur.com/FkYHteO.png)

Update more informations, * fields are required.
![img_store_listing_4](https://i.imgur.com/PDhmHxU.png)

If you has privacy policy url, fill your url to the field without checking to box.
Otherwise, check to box.

`- Content rating:` 

Answer **yes/no** some questions about your app. You must upload an APK before taking the content rating questionnaire.

`- App release`: 

where you submit app in mode **release/beta/alpha**

![img_app_release_1](https://i.imgur.com/etLlFmr.png)
Choose Production to release final build.

![img_app_release_2](https://i.imgur.com/hIaJ5H6.png)
Click **CREATE RELEASE**

![img_app_release_3](https://i.imgur.com/l8ux2Eu.png)
> Upload your signed apk.

> Update release name.

> Update **What's new in this release?**. Ex: -Fix bug :v

**Saved** and **Review**

`- Pricing & distribution`: 

Choose countries that you want to distribute app, payment method. Check in * boxes (they're required).

After submit app successfully, check it in playstore. Click **View on Google Play**
![img_check_playstore](https://i.imgur.com/9JeDj1F.png)

[Good luck to you](https://www.google.com.vn)