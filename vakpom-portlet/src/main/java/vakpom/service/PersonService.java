package vakpom.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import vakpom.model.Person;

/**
 * @author San Kponton
 *
 */
@Repository
public class PersonService {

	private static final String COLLECTION_NAME = "person";
	@Autowired
	private MongoTemplate mongoTemplate;
	
	
	
	public void addPerson(Person person) {
        if (!mongoTemplate.collectionExists(Person.class)) {
            mongoTemplate.createCollection(Person.class);
        }       
        person.setId(UUID.randomUUID().toString());
        mongoTemplate.insert(person, COLLECTION_NAME);
    }
     
    public List<Person> listPerson() {
        return mongoTemplate.findAll(Person.class, COLLECTION_NAME);
    }
     
    public void deletePerson(Person person) {
        mongoTemplate.remove(person, COLLECTION_NAME);
    }
     
    public void updatePerson(Person person) {
        mongoTemplate.insert(person, COLLECTION_NAME);      
    }
}
