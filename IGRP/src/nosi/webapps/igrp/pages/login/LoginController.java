package nosi.webapps.igrp.pages.login;

import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Session_;
import java.io.IOException;


public class LoginController extends Controller {		

	public Response actionLogin() throws IOException, IllegalArgumentException, IllegalAccessException{
		// first
		if(Igrp.getInstance().getUser().isAuthenticated()){
			return this.redirect(Igrp.getInstance().getHomeUrl()); // go to home (Bug here)
		}
		Login model = new Login();
		LoginView view = new LoginView(model);
		//Set user and password for demo
		view.user.setValue("demo");
		view.password.setValue("demo");
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			
			model.load();
			
			switch(Igrp.getInstance().getAppConfig().getAuthenticationType()){
			
				case "db": this.loginWithDb(model.getUser(), model.getPassword()); break;
				
				case "ldap": this.loginWithLdap(); break;
				
				case "oauth2":break;
				
				default:;
			}
		}
		
		return this.renderView(view,true);
	}
	
	// Use default connectionName "db1" and default igrp user table
	private void loginWithDb(String username, String password) throws IOException{
		User user = (User) new User().findIdentityByUsername(username);
		if(user != null && user.validate(nosi.core.webapp.User.encryptToHash(password, "MD5"))){
			if(user.getStatus() == 1){
				
				Profile profile = (Profile) new Profile().getByUser(user.getId());
				Organization organization = new Organization();
				ProfileType profileType = new ProfileType();
				
				profileType.setId(profile.getProf_type_fk());
				organization.setId(profile.getOrg_fk());
				
				user.setOrganica(organization);
				user.setProfile(profileType);
					if(profile != null && Igrp.getInstance().getUser().login(user, 3600 * 24 * 30)){
						if(!Session_.afterLogin())
							Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Error no registo session ...");
						//String backUrl = Route.previous(); // remember the last url that was requested by the user
						this.redirect("igrp", "home", "index"); // always go to home index url
					}
					else
						Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Login inv�lido ...");
			}
			else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Utilizador desativado. Por favor contacte o Administrador.");
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "A sua conta ou palavra-passe est� incorreta. Se n�o se lembra da sua palavra-passe, contacte o Administrador.");
	
	}
	
	// Use ldap protocol to make login
	private void loginWithLdap(){
		// Not set yet
	}
	
	public Response actionLogout() throws IOException{
		String currentSessionId = Igrp.getInstance().getRequest().getRequestedSessionId();
		if(Igrp.getInstance().getUser().logout()){
			if(!Session_.afterLogout(currentSessionId))
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ooops !!! Ocorreu um erro com registo session ...");
		}else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Ocorreu um erro no logout.");
		return this.redirect("igrp", "login", "login");
	}
}