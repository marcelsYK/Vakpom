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
public class InitMongoService {

	@Autowired
	MongoTemplate mongoTemplate;

	public void init() {
		// Drop existing collections
//		mongoTemplate.dropCollection("role");
		mongoTemplate.dropCollection("user");
		mongoTemplate.dropCollection("business");

		// Create new role records

/*		Role adminRole = new Role();
		adminRole.setId(UUID.randomUUID().toString());
		adminRole.setRole(1);

		Role userRole = new Role();
		userRole.setId(UUID.randomUUID().toString());
		userRole.setRole(2);
*/
		// Create new user records

		List<User> batchUsersToSave = new ArrayList<User>();
		User john = new User.Builder().withFirstName("John")
				.withLastName("Smith").withUsername("john@test.com")
				.withPassword("test").withZipcode(1536).withCountry("India")
				.build();

		batchUsersToSave.add(john);

		User yushu = new User.Builder().withFirstName("Yushu")
				.withLastName("Song").withUsername("yushu@vakpom.com")
				.withPassword("test").withZipcode(68151).withCountry("China")
				.build();

		batchUsersToSave.add(yushu);

		User san = new User.Builder().withFirstName("San")
				.withLastName("Kponton").withUsername("san@vakpom.com")
				.withPassword("test").withZipcode(68114).withCountry("Togo")
				.build();

		batchUsersToSave.add(san);

		System.out.println("test8888888888888888888888888888"
				+ san.getFirstName());

		// Create new business records
		Business uno = new Business(UUID.randomUUID().toString(), "Uno",
				"School", "blablabla", "1212121", "null", "Pacific", "68114",
				"Omaha", "USA", 10, 2);
		Business unl = new Business(UUID.randomUUID().toString(), "Unl",
				"School", "blablabla", "454545", "null", "Q street", "68184",
				"Lincoln", "USA", 10, 2);
		Business Hokuto = new Business(UUID.randomUUID().toString(), "Hokuto",
				"School", "blablabla", "454545", "null", "Chen Street", "7878",
				"Pekin", "China", 10, 2);
		Business esgis= new Business(UUID.randomUUID().toString(), "Esgis",
				"School", "blablabla", "454545", "null", "", "5565",
				"Lome", "Togo", 10, 2);
		Business alocodrome = new Business(UUID.randomUUID().toString(), "alocodrome",
				"restaurant", "blablablxda", "2251545", "null", "Cocody", "1536",
				"Abidjan", "Ivory Coast", 10, 2);
		
		// Insert to db
//		mongoTemplate.insert(adminRole, "role");
//		mongoTemplate.insert(userRole, "role");
		mongoTemplate.insert(uno, "business");
		mongoTemplate.insert(Hokuto, "business");
		mongoTemplate.insert(esgis, "business");
		mongoTemplate.insert(alocodrome, "business");
		mongoTemplate.insert(unl, "business");
		mongoTemplate.insert(batchUsersToSave, "user");
	}
}
