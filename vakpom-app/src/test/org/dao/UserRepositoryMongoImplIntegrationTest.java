package org.dao;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.scy.domain.Role;
import org.scy.domain.User;
import org.scy.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.Mongo;

import de.flapdoodle.embedmongo.MongoDBRuntime;
import de.flapdoodle.embedmongo.MongodExecutable;
import de.flapdoodle.embedmongo.MongodProcess;
import de.flapdoodle.embedmongo.config.MongodConfig;
import de.flapdoodle.embedmongo.distribution.Version;
import de.flapdoodle.embedmongo.runtime.Network;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:test-config.xml")
public class UserRepositoryMongoImplIntegrationTest {
	
	Logger logger = Logger.getLogger(UserRepositoryMongoImplIntegrationTest.class);
			
	@Autowired
	private UserRepository userRepository;
	
	private static final String DB_NAME = "pretech_embedded1";
	private MongodExecutable mongodExe;
	private MongodProcess mongod;
	private Mongo mongo;
	private DB db;
	private DBCollection collection;

	@Before
	public void setup() throws Exception {
		// Creating Mongodbruntime instance
		MongoDBRuntime runtime = MongoDBRuntime.getDefaultInstance();
		// Creating MongodbExecutable
		mongodExe = runtime.prepare(new MongodConfig(Version.V2_0_1, 12345,
				Network.localhostIsIPv6()));
		// Starting Mongodb
		mongod = mongodExe.start();
		mongo = new Mongo("localhost", 12345);
		// Creating DB
		db = mongo.getDB(DB_NAME);
		// Creating collection Object and adding values
		collection = db.getCollection("pretechEmbeddedCol");

	
	}

	@After
	public void teardown() throws Exception {
		mongod.stop();
		mongodExe.cleanup();
	}

	@Test
	public void testPretechAddressPersistance() {
		BasicDBObject contact = new BasicDBObject();
		contact.put("name", "pretech");
		contact.put("address", "bangalore");
		// Inserting document
		collection.insert(contact);
		DBCursor cursorDoc = collection.find();
		BasicDBObject contact1 = new BasicDBObject();
		while (cursorDoc.hasNext()) {
			contact1 = (BasicDBObject) cursorDoc.next();
			System.out.println(contact1);
		}
		assertEquals(contact1.get("name"), "pretech1");
	}
	
	
	 @Test
	    public void testSave() {
	    	Role adminRole = new Role();
			adminRole.setId(UUID.randomUUID().toString());
			adminRole.setRole(1);
			User san = new User(UUID.randomUUID().toString(), "San", "Kponton",
					"san", "21232f297a57a5a743894a0e4a801fc8", adminRole);
			
			userRepository.save(san);
	        
	        List<User> usersInCollection = userRepository.findAll();
	        
	        for (User user : usersInCollection) {
	        	logger.info("USERNAME" + user.getFirstName());
	  	        }
	  	        
	        assertEquals("Only 1 User should exist in collection, but there are "
	                + usersInCollection.size(), 1, usersInCollection.size());
	    }

	    @Test
	    public void testFindByKey() {
	        
	        // Setup Test Data
	    	// Create new role records
			
			Role adminRole = new Role();
			adminRole.setId(UUID.randomUUID().toString());
			adminRole.setRole(1);

			Role userRole = new Role();
			userRole.setId(UUID.randomUUID().toString());
			userRole.setRole(2);
			
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
	        
	        for (User user : batchUsersToSave) {
	        	//      template.save(user);
	        }
	        
	        // Execute Test
	        List<User> matches = (List<User>) userRepository.findByUsername("TEST");
	        
	        // Note: Since our test data (populateDummies) have only 2
	        // records with key "TEST", this should be 2
	        assertEquals("Expected only two Users with key TEST, but there are "
	                + matches.size(), 2, matches.size());
	    }
}