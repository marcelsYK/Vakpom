package org.scy.domain;

public enum Roles {

	admin("ADMIN"), user("USER");
	
	private String role;

	private Roles (String role){
		this.role=role;
	}
	
}
