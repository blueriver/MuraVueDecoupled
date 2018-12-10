<!---
	This file is part of Mura CMS.

	Mura CMS is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, Version 2 of the License.

	Mura CMS is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

	Linking Mura CMS statically or dynamically with other modules constitutes
	the preparation of a derivative work based on Mura CMS. Thus, the terms
	and conditions of the GNU General Public License version 2 ("GPL") cover
	the entire combined work.

	However, as a special exception, the copyright holders of Mura CMS grant
	you permission to combine Mura CMS with programs or libraries that are
	released under the GNU Lesser General Public License version 2.1.

	In addition, as a special exception, the copyright holders of Mura CMS
	grant you permission to combine Mura CMS with independent software modules
	(plugins, themes and bundles), and to distribute these plugins, themes and
	bundles without Mura CMS under the license of your choice, provided that
	you follow these specific guidelines:

	Your custom code

	• Must not alter any default objects in the Mura CMS database and
	• May not alter the default display of the Mura CMS logo within Mura CMS and
	• Must not alter any files in the following directories:

		/admin/
		/tasks/
		/config/
		/requirements/mura/
		/Application.cfc
		/index.cfm
		/MuraProxy.cfc

	You may copy and distribute Mura CMS with a plug-in, theme or bundle that
	meets the above guidelines as a combined work under the terms of GPL for
	Mura CMS, provided that you include the source code of that other code when
	and as the GNU GPL requires distribution of source code.

	For clarity, if you create a modified version of Mura CMS, you are not
	obligated to grant this special exception for your modified version; it is
	your choice whether to do so, or to make such modified version available
	under the GNU General Public License version 2 without this exception.  You
	may, if you choose, apply this exception to your own modified versions of
	Mura CMS.
--->
<cfcomponent extends="mura.cfobject">


	<!---
			This is the THEME contentRenderer.cfc

			* Add theme-specific methods here
			* Any methods here will be accessible with the following notation:
				$.yourFunctionName()
	--->

	<cfscript>
		this.primaryContentTypes='Page,Link,File';
		this.templateArray=['default'];
		
		this.cookieConsentEnabled=false;
		this.cookieConsentType='drawer';
		this.cookieConsentButtonClass="btn btn-primary";
		this.cookieConsentWrapperClass="";
		this.cookieConsentWidth="sm";

		// GENERAL
		this.directImages=true;
		this.deferMuraJS=true;
		this.layoutmanager=true;
		this.legacyobjects=false;
		this.validateCSRFTokens=true; //This will eventually default to true
		this.jsLib = "jquery";
		this.jsLibLoaded = true;
		this.suppressWhitespace = false;
		this.generalWrapperClass = "";
		this.generalWrapperBodyClass = "";

		this.bodymetaImageClass = "";

		// headings
		this.headline = "h1";
		this.subHead1 = "h2";
		this.subHead2 = "h3";
		this.subHead3 = "h4";
		this.subHead4 = "h5";

		// preloader markup for async objects
		this.preloaderMarkup='<div class="text-center container"><i class="mura-preloader fa fa-refresh fa-spin"></i></div>';

		// nav and list item vars
		this.navWrapperClass = "";
		this.navWrapperBodyClass = "";
		this.navLIClass = "";
		this.liHasKidsClass = "";
		this.liHasKidsCustomString = "";
		this.liCurrentClass = "";
		this.liCurrentCustomString = "";
		this.aNotCurrentClass = "";
		this.aHasKidsClass = "";
		this.aHasKidsCustomString = "";
		this.aCurrentClass = "";
		this.aCurrentCustomString = "";
		this.ulTopClass = "";
		this.ulNestedClass = "";
		this.ulNestedCustomString = "";
		this.liNestedClass = "";


		this.navSubWrapperClass=this.navWrapperClass;
		this.navSubWrapperBodyClass=this.navWrapperBodyClass;
		this.navPeerWrapperClass=this.navWrapperClass;
		this.navPeerWrapperBodyClass=this.navWrapperBodyClass;
		this.navFolderWrapperClass=this.navWrapperClass;
		this.navFolderWrapperBodyClass=this.navWrapperBodyClass;
		this.navStandardWrapperClass=this.navWrapperClass;
		this.navStandardWrapperBodyClass=this.navWrapperBodyClass;
		this.navMultiLevelWrapperClass=this.navWrapperClass;
		this.navMultiLevelWrapperBodyClass=this.navWrapperBodyClass;
		this.navArchiveWrapperClass=this.navWrapperClass;
		this.navArchiveWrapperBodyClass=this.navWrapperBodyClass;
		this.navCategoryWrapperClass=this.navWrapperClass;
		this.navCategoryWrapperBodyClass=this.navWrapperBodyClass;


		//Queue async display objects to render when scrolled into view
		this.queueObjects=false;

		// pagination vars
		this.ulPaginationClass="";
		this.ulPaginationWrapperClass="";
		this.liPaginationCurrentClass="";
		this.liPaginationNotCurrentClass="";
		this.aPaginationCurrentClass="";
		this.aPaginationNotCurrentClass="";

		//These are used as primary form settings as well as in the form builder.
		this.formWrapperClass = "";
		this.formWrapperClass=this.generalWrapperClass;
		this.formWrapperBodyClass=this.generalWrapperBodyClass;
		this.formErrorWrapperClass = "";
		this.formResponseWrapperClass = "";
		this.formFieldWrapperClass = "";
		this.formFieldLabelClass = "";
		this.formInputWrapperClass = "";
		this.formInputClass ="";
		this.formGeneralControlClass = "";
		this.formInputClass=this.formGeneralControlClass;
		this.formSelectClass = this.formGeneralControlClass;
		this.formTextareaClass = this.formGeneralControlClass;
		this.formFileClass = this.formGeneralControlClass;
		this.formCheckboxClass = "";
		this.formCheckboxLabelClass = "";
		this.formCheckboxWrapperClass = "";
		this.formRadioClass = "";
		this.formRadioLabelClass = "";
		this.formRadioWrapperClass = "";
		this.formButtonWrapperClass = "";
		this.formButtonInnerClass="";
		this.formButtonClass = "";
		this.formRequiredWrapperClass="";
		this.formButtomSubmitclass = "";
		this.formButtonSubmitLabel = "";
		this.formButtonNextClass = "";
		this.formButtonNextLabel = "";
		this.formButtonBackClass = "";
		this.formButtonBackLabel = "";
		this.formButtonCancelLabel = "";
		this.formButtonCancelClass = "";

		// images
		this.imageClass="";

		// tables
		this.tableClass = "";
		this.tableHeadClass = "";
		this.tableHeaderClass = "";
		this.tableBodyClass = "";
		this.tableRowClass = "";
		this.tableCellClass = "";
		this.tableFooterClass = "";

		// alerts
		this.alertSuccessClass = "";
		this.alertInfoClass = "";
		this.alertWarningClass = "";
		this.alertDangerClass = "";

		// SPECIFIC (Display Objects)
		// Use these variables to pass-in specific classes without having to create custom versions of the include

		// calendar/dsp_showMonth.cfm
		this.calendarWrapperClass="";
		this.calendarTableClass=this.tableClass;
		//this.calendarTableHeaderClass="";

		// calendar/dspList.cfm
		this.calendarListWrapperClass="";

		// comments/index.cfm
		 this.commentsWrapperClass="";
		 this.commentSortContainerClass="";
		 this.commentSortWrapperClass="";
		 this.commentSortSelectClass=this.formInputClass;
		 this.commentFormWrapperClass=this.generalWrapperClass;
		 this.commentFormClass="";
		 this.commentNewClass=this.formButtonClass;
		 this.commentFieldWrapperClass=this.formFieldWrapperClass;
		 this.commentFieldLabelClass=this.formFieldLabelClass;
		 this.commentInputWrapperClass="";
		 this.commentInputClass=this.formInputClass;
		 this.commentCheckboxClass="";
		 this.commentPrefsInputWrapperClass="";
		 this.commentSubmitButtonWrapperClass="";
		 this.commentSubmitButtonClass=this.formButtonClass;
		 this.commentMoreCommentsUpClass="";
		 this.commentMoreCommentsDownClass="";
		 this.commentMoreCommentsContainer="";
		 this.commentRequiredWrapperClass="";
		 this.commentThumbClass="";
		 this.commentSpamClass="";
		 this.commentSpamLinkClass="";
		 this.commentClass="";
		 this.commentDateTimeClass="";
		 this.commentReplyClass="";
		 this.commentAwaitingApproval="";
		 this.commentAdminButtonWrapperClass="";
		 this.commentUserEmailClass="";
		 this.commentDeleteButtonClass="";
		 this.commentEditButtonClass="";
		 this.commentApproveButtonClass="";

		// comments/dsp_comment.cfm
	 	this.emailLinkClass=this.formButtonClass;
		this.commentsLinkClass=this.formButtonClass;
		this.approveCommentLinkClass=this.formButtonClass;
		this.deleteCommentLinkClass=this.formButtonClass;

		// dataresponses/dsp_detail.cfm
		this.dataResponseListClass="";

		// dataresponses/dsp_list.cfm
		this.dataResponseTableClass="";
		this.dataResponsePaginationClass=this.ulPaginationClass;


		// dsp_categories_nest.cfm
		this.categoriesNestCheckboxClass="";

		// dsp_content_list.cfm
		this.contentListImageStyles=true;
		this.contentListImagePadding=20;  //must be pixels
		this.contentListPropertyMap={
			containerEl={tag="div"},
			itemEl={tag="dl"},
			labelEl={tag="span"},
			title={tag="dt"},
			date={tag="dt"},
			credits={tag="dd",showLabel=true,rbkey="list.by"},
			tags={tag="dd",showLabel=true,labelDelim=":",rbkey="tagcloud.tags"},
			rating={tag="dd",showLabel=true,labelDelim=":",rbkey="list.rating"},
			"default"={tag="dd"}
		};

		this.contentListWrapperDivClass="";
		this.contentListItemImageLinkClass="";
		this.aContentListCurrentClass='';
		this.aContentListCurrentAttributes='';
		this.aContentListNotCurrentClass='';

		//dsp_meta_list.cfm
		this.aMetaListCurrentClass='';
		this.aMetaListCurrentAttributes='';
		this.aMetaListNotCurrentClass='';

		// dsp_folder.cfm
		this.folderWrapperClass="";

		// dsp_edit_profile.cfm
		this.editProfileWrapperClass="";
		this.editProfileFormClass="";
		this.editProfileFormGroupWrapperClass=this.formFieldWrapperClass;
		this.editProfileFieldLabelClass="";
		this.editProfileFormFieldsWrapperClass="";
		this.editProfileFormFieldsClass=this.formInputClass;
		this.editProfileExtAttributeDownloadClass="";
		this.editProfileHelpBlockClass="";
		this.editProfileExtAttributeFileWrapperClass="";
		this.editProfileExtAttributeDownloadClass="";
		this.editProfileExtAttributeDownloadButtonClass=this.formButtonClass;
		this.editProfileSubmitButtonWrapperClass="";
		this.editProfileSubmitButtonClass="";
		this.editProfileSuccessMessageClass=this.alertSuccessClass;

		// dsp_email_dropdown.cfm
		this.emailDropdownSelectClass="";

		// dsp_event_reminder_form.cfm
		this.eventReminderFormWrapperClass="";
		this.eventReminderFormClass=this.generalWrapperClass;
		this.eventReminderFieldWrapperClass="";
		this.eventReminderFormLabelsClass=this.formFieldLabelClass;
		this.eventReminderSubmitClass=this.formButtonClass;

		// dsp_features.cfm
		this.featuresWrapperClass="";

		// dsp_feed.cfm
		this.localIndexWrapperClass="";
		this.remoteFeedWrapperClass="";

		// dsp_login.cfm
		this.loginWrapperClass="";
		this.loginWrapperInnerClass="";
		this.loginFormClass="";
		this.forgotPasswordFormClass="";
		this.loginFormGroupWrapperClass=this.formFieldWrapperClass;
		this.loginFormFieldLabelClass="";
		this.loginFormFieldWrapperClass="";
		this.loginFormFieldClass=this.formInputClass;
		this.loginFormPrefsClass="";
		this.loginFormCheckboxClass="";
		this.loginFormSubmitWrapperClass="";
		this.loginFormSubmitClass=this.formButtonClass;
		this.notRegisteredLinkClass="";

		// dsp_mailing_list_master.cfm
		this.mailingListWrapperClass=this.generalWrapperClass;
		this.mailingListFormClass="f";
		this.mailingListFormGroupWrapperClass=this.formFieldWrapperClass;
		this.mailingListFormLabelClass="";
		this.mailingListFormFieldWrapperClass="";
		this.mailingListFormInputClass=this.formInputClass;
		this.mailingListCheckboxWrapperClass="";
		this.mailingListCheckboxClass="";
		this.mailingListSubmitWrapperClass="";
		this.mailingListSubmitClass=this.formButtonClass;

		// dsp_nextN.cfm
		this.nextNWrapperClass="";
		this.nextNInnerClass="";

		// dsp_search_form.cfm
		this.searchFormClass="";
		this.searchFormInputWrapperClass=this.formInputWrapperClass;
		this.searchFormInputClass=this.formInputClass;
		this.searchFormSubmitWrapperClass=this.formButtonInnerClass;
		this.searchFormSubmitClass="";

		// dsp_search_results.cfm
		this.searchShowNumbers=0;
		this.searchResultWrapperClass="";
		this.searchResultInnerClass="";
		this.searchResultsRowClass="";
		this.searchResultsMoreResultsRowClass="";
		this.searchResultsListClass="";
		this.searchResultsPagerClass="";
		this.searchAgainRowClass="";
		this.searchAgainInnerClass="";
		this.searchAgainFormClass="";
		this.searchAgainInputWrapperClass=this.formInputWrapperClass;
		this.searchAgainFormInputClass=this.formInputClass;
		this.searchAgainButtonWrapperClass=this.formButtonInnerClass;
		this.searchAgainSubmitClass=this.formButtonClass;

		// dsp_user_tools.cfm
		this.userToolsLoginWrapperClass="";
		this.userToolsLoginFormClass="";
		this.userToolsFormGroupWrapperClass=this.formFieldWrapperClass;
		this.userToolsLoginFormLabelClass="";
		this.userToolsLoginFormInputWrapperClass="";
		this.userToolsLoginFormInputClass=this.formInputClass;
		this.userToolsLoginFormFieldInnerClass="";
		this.userToolsLoginFormCheckboxClass="";
		this.userToolsLoginFormSubmitClass=this.formButtonClass;
		this.userToolsNotRegisteredLinkClass="";
		this.userToolsWrapperClass="";
		this.userToolsEditProfileLinkClass="";
		this.userToolsLogoutLinkClass="";

		// formbuilder/dsp_form.cfm
		this.formBuilderFieldWrapperClass=this.formFieldWrapperClass;
		this.formBuilderButtonWrapperClass="";
		this.formBuilderSubmitClass=this.formButtonClass;

		// formbuilder/fields/dsp_checkbox.cfm
		// formbuilder/fields/dsp_dropdown.cfm
		// formbuilder/fields/dsp_file.cfm
		// formbuilder/fields/dsp_radio.cfm
		// formbuilder/fields/dsp_textfield.cfm

		this.formBuilderFormFieldsClass=this.formInputClass;

		// formbuilder/fields/field_dropdown.cfm
		this.formBuilderTabHeaderClass="";
		this.formBuilderDisabledInputClass="";
		this.formBuilderCheckboxClass="";

		// gallery/index.cfm
		this.galleryWrapperClass="";
		this.galleryULClass="";
		this.galleryThumbnailClass="";

		// nav/calendarNav/index.cfm
		this.navCalendarWrapperClass="";

		// nav/calendarNav/navTools.cfc
		this.navCalendarTableClass="";

		// nav/dsp_sequential.cfm
		this.navSequentialWrapperClass="";
		this.navSequentialULClass="";

		// nav/dsp_tag_cloud.cfm
		this.tagCloudWrapperClass="";

		// navArchive
		//this.navArchiveWrapperClass="";
		//this.navArchiveListClass="";

		// navBreadcrumb
		this.navBreadcrumbULClass="";
		this.liBreadcrumbCurrentClass="";
		this.liBreadcrumbNotCurrentClass="";
		this.aBreadcrumbCurrentClass="";
		this.aBreadcrumbNotCurrentClass="";

		// rater/index.cfm
		this.raterObjectWrapperClass="";
		this.raterWrapperClass="";
		this.avgRatingWrapperClass="";

		//7.1
		this.navPrevDecoration="";
		this.navNextDecoration="";
		this.userFavoritesWrapperClass="";
		this.pageToolsWrapperClass="";

	</cfscript>
</cfcomponent>
