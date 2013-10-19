package org.scy.service;

import java.io.Serializable;

public abstract class AbstractService<T extends Serializable> {
/*
	private Class <T> clazz;

	public void setClazz(Class <T> clazz) {
		this.clazz = clazz;
	}
	
	
	public T create(T entity) {
		entity.setId(UUID.randomUUID().toString());
		user.getRole().setId(UUID.randomUUID().toString());
		
		// We must save both separately since there is no cascading feature
		// in Spring Data MongoDB (for now)
		roleRepository.save(user.getRole());
		return userRepository.save(user);
	}
	
	public User read(User user) {
		return user;
	}
	
	public List<User> readAll() {
		return userRepository.findAll();
	}
	
	public User update(User user) {
		User existingUser = userRepository.findByUsername(user.getUsername());
		
		if (existingUser == null) {
			return null;
		}
		
		existingUser.setFirstName(user.getFirstName());
		existingUser.setLastName(user.getLastName());
		existingUser.getRole().setRole(user.getRole().getRole());
		
		// We must save both separately since there is no cascading feature
		// in Spring Data MongoDB (for now)
		roleRepository.save(existingUser.getRole());
		return userRepository.save(existingUser);
	}
	
	public Boolean delete(User user) {
		User existingUser = userRepository.findByUsername(user.getUsername());
		
		if (existingUser == null) {
			return false;
		}
		
		// We must delete both separately since there is no cascading feature
		// in Spring Data MongoDB (for now)
		roleRepository.delete(existingUser.getRole());
		userRepository.delete(existingUser);
		return true;
	}
	*/
}
