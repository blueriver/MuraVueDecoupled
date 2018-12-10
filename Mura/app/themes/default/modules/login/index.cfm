<cfif not isBoolean(variables.$.event('isBlocked'))>
	<cfset variables.$.event('isBlocked',false)>
</cfif>
<cfoutput>
	<div id="svLoginContainer" class="mura-login-container #this.loginWrapperClass#">
		<div class="#this.loginWrapperInnerClass#">
		
			<cfset errorMessage = '' />
			<cfif StructKeyExists(session, 'mfa') and Len(session.mfa.username)>
				<cfset objStrikes = CreateObject('component', 'mura.user.userstrikes').init(session.mfa.username, application.configBean) />
				<cfset isBlocked = objStrikes.isBlocked() />
			<cfelse>
				<cfset isBlocked = StructKeyExists(session, 'blockLoginUntil') and IsDate(session.blockLoginUntil) and session.blockLoginUntil gt Now() />
			</cfif>

			<cfif isBlocked>
				<cfset errorMessage = variables.$.rbKey('login.blocked') />
			<cfelseif variables.$.event('status') eq 'denied'>
				<cfset errorMessage = variables.$.rbKey('login.denied') />
			<cfelseif variables.$.event('status') eq 'failed'>
				<cfset errorMessage = variables.$.rbKey('login.failed') />
			<cfelseif variables.$.event('failedchallenge') eq 'true'>
				<cfset errorMessage = variables.$.rbKey('login.incorrectauthorizationcode') />
			</cfif>

			<cfif Len(errorMessage)>
				<div id="loginMsg" class="#this.alertDangerClass#">
					#errorMessage#
				</div>
			</cfif>

			<cfif not variables.$.event('isBlocked')>
				<cfif variables.$.event('status') eq 'challenge' and isdefined('session.mfa')>
					<cfset output=variables.$.renderEvent('onSiteMFAChallengeRender')>
					<cfif len(output)>
						#output#
					<cfelse>
						<cfif variables.$.getBean('configBean').getValue(property='MFAPerDevice',defaultValue=false) and not len(variables.$.event('authcode'))>
							<p id="loginMsg" class="#this.alertDangerClass#">#variables.$.rbKey('user.newdevice')#</p>
						</cfif>

						<cfif len(variables.$.event('authcode'))>
							<p id="loginMsg" class="#this.alertDangerClass#">#variables.$.rbKey('user.authcodeerror')#</p>
						</cfif>

						<form role="form" id="login" class="mura-login-form #this.loginFormClass# <cfif this.formWrapperClass neq "">#this.formWrapperClass#</cfif>" name="frmLogin" method="post" novalidate="novalidate">
							<div>
								<h3>#variables.$.rbKey('user.pleaseenterauthcode')#</h3>
								<!--- Username --->
								<div class="req #this.loginFormGroupWrapperClass#">
									<label for="txtUsername" class="#this.loginFormFieldLabelClass#">
										#variables.$.rbKey('user.authcode')#
										<ins>(#HTMLEditFormat(variables.$.rbKey('user.required'))#)</ins>
									</label>
									<div class="#this.loginFormFieldWrapperClass#">
										<input autocomplete="off" class="#this.loginFormFieldClass#" type="text" id="txtUsername" placeholder="#variables.$.rbKey('user.authcode')#" name="authcode" data-required="true" data-message="#htmlEditFormat(variables.$.rbKey('user.authcoderequired'))#" autofocus>
									</div>
								</div>

								<cfif variables.$.getBean('configBean').getValue(property='MFAPerDevice',defaultValue=false)>
									<input type="hidden" name="rememberdevice" value="1"/>
									<!---
									<div class="#this.loginFormGroupWrapperClass#">
										<div class="#this.loginFormPrefsClass#">
											<label class="#this.loginFormCheckboxClass#" for="cbRememberDevice" >
												<input type="checkbox" id="cbRememberDevice" name="rememberdevice" value="1"> #htmlEditFormat(variables.$.rbKey('user.rememberdevice'))#
											</label>
										</div>
									</div>
								--->

								</cfif>

								<div class="#this.loginFormGroupWrapperClass#">
									<div class="#this.loginFormSubmitWrapperClass#">
										<button type="submit" class="#this.loginFormSubmitClass#">#htmlEditFormat(variables.$.rbKey('user.submitauthcode'))#</button>
									</div>
								</div>
								#variables.$.renderCSRFTokens(format='form',context='login')#
								<input type="hidden" name="doaction" value="login">
								<input type="hidden" name="status" value="challenge">
								<input type="hidden" name="attemptChallenge" value="true">
							</div>
						</form>
					</cfif>
				<cfelse>
					<form role="form" id="login" class="mura-login-form #this.loginFormClass# <cfif this.formWrapperClass neq "">#this.formWrapperClass#</cfif>" name="frmLogin" method="post" novalidate="novalidate">

						<cfif listFindNoCase($.globalConfig().getEnableOauth(), 'google') or listFindNoCase($.globalConfig().getEnableOauth(), 'facebook') >						
								<div class="#this.loginFormGroupWrapperClass#">
									<div class="#this.loginFormSubmitWrapperClass#">
										<div class="mura-login-auth-wrapper">
										<!--- Use Google oAuth Button --->
										<cfif listFindNoCase($.globalConfig().getEnableOauth(), 'google')>
											<a href="#$.getBean('googleLoginProvider').generateAuthUrl(session.urltoken)#" title="#variables.$.rbKey('login.loginwithgoogle')#" class="mura-login-auth-btn ggl">
												<i class="fa fa-lg fa-google mi-google"></i>
												<span>#variables.$.rbKey('login.loginwithgoogle')#</span>
											</a>
										</cfif>
										<cfif listFindNoCase($.globalConfig().getEnableOauth(), 'facebook')>
											<a href="#$.getBean('facebookLoginProvider').generateAuthUrl(session.urltoken)#" title="#variables.$.rbKey('login.loginwithfacebook')#" class="mura-login-auth-btn fb"> 
					               	<i class="fa fa-lg fa-facebook mi-facebook"></i>
			                  	<span>#variables.$.rbKey('login.loginwithfacebook')#</span>
			 									</a>
										</cfif>
									</div>
								</div>
							</div>
						</cfif>
						
						<div>
							<cfif listFindNoCase($.globalConfig().getEnableOauth(), 'google') or listFindNoCase($.globalConfig().getEnableOauth(), 'facebook') >
			              <div class="text-divider"><span>#variables.$.rbKey('login.or')#</span></div>
										<h3>#variables.$.rbKey('login.loginwithcredentials')#</h3>

							<cfelse>
									<h3>#variables.$.rbKey('user.pleaselogin')#</h3>
							</cfif>

							<!--- Username --->
							<div class="req #this.loginFormGroupWrapperClass#">
								<label for="txtUsername" class="#this.loginFormFieldLabelClass#">
									#variables.$.rbKey('user.username')#
									<ins>(#HTMLEditFormat(variables.$.rbKey('user.required'))#)</ins>
								</label>
								<div class="#this.loginFormFieldWrapperClass#">
									<input class="#this.loginFormFieldClass#" type="text" id="txtUsername" placeholder="#variables.$.rbKey('user.username')#" name="username" data-required="true" data-message="#htmlEditFormat(variables.$.rbKey('user.usernamerequired'))#" autofocus>
								</div>
							</div>

							<!--- Password --->
							<div class="req #this.loginFormGroupWrapperClass#">
								<label for="txtPassword" class="#this.loginFormFieldLabelClass#">
									#variables.$.rbKey('user.password')#
									<ins>(#HTMLEditFormat(variables.$.rbKey('user.required'))#)</ins>
								</label>
								<div class="#this.loginFormFieldWrapperClass#">
									<input class="#this.loginFormFieldClass#" type="password" id="txtPassword" name="password" placeholder="#variables.$.rbKey('user.password')#" data-required="true" data-message="#htmlEditFormat(variables.$.rbKey('user.passwordrequired'))#" autocomplete="off">
								</div>
							</div>

							<cfif not variables.$.getBean('configBean').getValue(property='MFA',defaultValue=false)>
								<!--- Remember Me --->
								<div class="#this.loginFormGroupWrapperClass#">
									<div class="#this.loginFormPrefsClass#">
										<label class="#this.loginFormCheckboxClass#" for="cbRememberMe" >
											<input type="checkbox" id="cbRememberMe" name="rememberMe" value="1"> #htmlEditFormat(variables.$.rbKey('user.rememberme'))#
										</label>
									</div>
								</div>
							</cfif>

							<!--- Login Button --->
							<div class="#this.loginFormGroupWrapperClass#">
								<div class="#this.loginFormSubmitWrapperClass#">
									<button type="submit" class="#this.loginFormSubmitClass#">#htmlEditFormat(variables.$.rbKey('user.login'))#</button>
								</div>
							</div>

							<input type="hidden" name="doaction" value="login">
							<input type="hidden" name="linkServID" value="#HTMLEditFormat(variables.$.event('linkServID'))#">
							<input type="hidden" name="returnURL" value="#HTMLEditFormat(variables.$.event('returnURL'))#">
							#variables.$.renderCSRFTokens(format='form',context='login')#
						</div>
					</form>


					<cfif variables.$.event('doaction') eq 'sendlogin'>
						<cfset msg2=application.userManager.sendLoginByEmail(variables.$.event('email'), variables.$.event('siteID'),'#urlencodedformat(variables.$.event('returnURL'))#')>
					</cfif>

					<!--- Forgot Username / Password Form --->
					<form name="form2" class="mura-send-login #this.forgotPasswordFormClass# <cfif this.formWrapperClass neq "">#this.formWrapperClass#</cfif>" method="post" id="sendLogin" novalidate="novalidate">
						<div>
							<h3>#variables.$.rbKey('user.forgetusernameorpassword')#</h3>
							<p>#variables.$.rbKey('user.forgotloginmessage')#</p>

							<cfif isdefined('msg2')>
								<cfif FindNoCase('is not a valid',msg2)><div class="#this.loginFormErrorClass#">#HTMLEditFormat(variables.$.siteConfig("rbFactory").getResourceBundle().messageFormat(variables.$.rbKey('user.forgotnotvalid'),variables.$.event('email')))#<cfelseif FindNoCase('no account',msg2)><div class="#this.alertDangerClass#">#HTMLEditFormat(variables.$.siteConfig("rbFactory").getResourceBundle().messageFormat(variables.$.rbKey('user.forgotnotfound'),variables.$.event('email')))#<cfelse><div class="#this.alertSuccessClass#">#variables.$.rbKey('user.forgotsuccess')#</cfif></div>
							</cfif>

							<!--- Email --->
							<div class="#this.loginFormGroupWrapperClass#">
								<label class="#this.loginFormFieldLabelClass#" for="txtEmail">#variables.$.rbKey('user.email')#</label>
								<div class="#this.loginFormFieldWrapperClass#">
									<input id="txtEmail" name="email" class="#this.loginFormFieldClass#" type="text" placeholder="#variables.$.rbKey('user.email')#" data-validate="email" data-required="true" data-message="#htmlEditFormat(variables.$.rbKey('user.emailvalidate'))#" />
								</div>
							</div>

							<!--- Submit Button --->
							<div class="#this.loginFormGroupWrapperClass#">
								<div class="#this.loginFormSubmitWrapperClass#">
									<button type="submit" class="#this.loginFormSubmitClass#">#htmlEditFormat(variables.$.rbKey('user.getpassword'))#</button>
								</div>
							</div>

							<input type="hidden" name="doaction" value="sendlogin">
							<input type="hidden" name="linkServID" value="#HTMLEditFormat(variables.$.event('linkServID'))#">
							<input type="hidden" name="display" value="login">
							<input type="hidden" name="returnURL" value="#HTMLEditFormat(variables.$.event('returnURL'))#">
						</div>
					</form>

					<!--- Not Registered? --->
					<cfif variables.$.siteConfig('ExtranetPublicReg')>
						<div id="notRegistered" class="mura-not-registered">
							<#variables.$.getHeaderTag('subHead1')# class="center">#variables.$.rbKey('user.notregistered')# <a class="#this.notRegisteredLinkClass#" href="#variables.$.siteConfig('editProfileURL')#&returnURL=#urlencodedformat(variables.$.event('returnURL'))#">#variables.$.rbKey('user.signup')#</a></#variables.$.getHeaderTag('subHead1')#>
						</div>
					</cfif>
				</cfif>

				<script type="text/javascript">
					var loginForm = document.getElementById("login");
					if ( loginForm !== null ) {
					   loginForm.elements[0].focus();
					}
				</script>
			</cfif>
		</div>
	</div>
</cfoutput>
