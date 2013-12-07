package org.scy.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.scy.domain.Business;
import org.scy.domain.Role;
import org.scy.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

/**
 * Service for initializing MongoDB with sample data using {@link MongoTemplate}
 */
public class CopyOfInitMongoService {

	@Autowired
	MongoTemplate mongoTemplate;

	public void init() {
		// Drop existing collections
		mongoTemplate.dropCollection("role");
		mongoTemplate.dropCollection("user");
		mongoTemplate.dropCollection("business");
		
		// Create new role records
		
		Role adminRole = new Role();
		adminRole.setId(UUID.randomUUID().toString());
		adminRole.setRole(1);

		Role userRole = new Role();
		userRole.setId(UUID.randomUUID().toString());
		userRole.setRole(2);
		
		// Create new user records
		
		List<User> batchUsersToSave = new ArrayList<User>();
		User john = new User(UUID.randomUUID().toString(), "John", "Smith",
				"john", "21232f297a57a5a743894a0e4a801fc3", adminRole);
		batchUsersToSave.add(john);
		
		User yushu = new User(UUID.randomUUID().toString(), "Yushu", "Test",
				"yushu", "21232f297a57a5a743894a0e4a801fc3", userRole);
		batchUsersToSave.add(yushu);
		
		User san = new User(UUID.randomUUID().toString(), "San", "Kponton",
				"san", "21232f297a57a5a743894a0e4a801fc8", adminRole);
		batchUsersToSave.add(san);
		
		
		
		
		// Create new business records
		Business uno =new Business(UUID.randomUUID().toString(), "Uno","School","blablabla","1212121","null","Pacific","68114","Omaha","USA",10,2);
		
		// Insert to db
		mongoTemplate.insert(adminRole, "role");
		mongoTemplate.insert(userRole, "role");
		mongoTemplate.insert(uno,"business");
		
		mongoTemplate.insert(batchUsersToSave , "user");
	}
}
