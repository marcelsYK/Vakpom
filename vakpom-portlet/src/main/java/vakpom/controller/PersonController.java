package vakpom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import vakpom.model.Person;
import vakpom.service.PersonService;

public class PersonController {

	 @Autowired
	    private PersonService personService;
	     
	    @RequestMapping(value = "/person", method = RequestMethod.GET)  
	    public String getPersonList(ModelMap model) {  
	        model.addAttribute("personList", personService.listPerson());  
	        return "output";  
	    }  
	     
	    @RequestMapping(value = "/person/save", method = RequestMethod.POST)  
	    public View createPerson(@ModelAttribute Person person, ModelMap model) {
	        if(StringUtils.hasText(person.getId())) {
	            personService.updatePerson(person);
	        } else {
	            personService.addPerson(person);
	        }
	        return new RedirectView("/vakpom-portlet/person");  
	    }
	         
	    @RequestMapping(value = "/person/delete", method = RequestMethod.GET)  
	    public View deletePerson(@ModelAttribute Person person, ModelMap model) {  
	        personService.deletePerson(person);  
	        return new RedirectView("/vakpom-portlet/person");  
	    }
}
