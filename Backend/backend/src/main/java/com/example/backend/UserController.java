package com.example.backend;

import java.util.Set;

import javax.validation.constraints.Null;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.StatelessSession;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.provider.HibernateUtils;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;



@Controller // This means that this class is a Controller
@RequestMapping(path = "/user") // This means URL's start with /demo (after Application path)
public class UserController    {
    @Autowired // This means to get the bean called userRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private UserRepository userRepository;
    @Autowired
    private DogRepository dogRepo;
    @PostMapping(path = "/new") // Map ONLY POST Requests
    public @ResponseBody String addNewUser(@RequestParam String uid, String email, String phone, String name) {
        User n = new User(uid, email, phone, name, new ContactList());
        userRepository.save(n);
        return "Saved";
    }
    @GetMapping(path = "/all")
    public @ResponseBody Iterable<User> getAll(){
        Iterable<User>  u = userRepository.findAll();
        return u;
    }

    @GetMapping(path = "/dogs")
    public @ResponseBody Set<Dog> findDogs(@RequestParam String uid) {
        User u = userRepository.findByUid(uid);
        return u.getOwnedDog();    
    }

    @PostMapping(path = "/location")
    public @ResponseBody String updatePos(@RequestParam Double lat, Double log, String uid){
        User u = userRepository.findByUid(uid);
        u.setPosition(new Position((log), (lat)));
        userRepository.save(u);
        return "true";
    }

    @GetMapping(path = "/find")
    public @ResponseBody User findUser(@RequestParam String uid){
       User u = userRepository.findByUid(uid);
       return u;
    }

    @PostMapping(path = "/newdog") // Map ONLY POST Requests
    public @ResponseBody String addNewDog(@RequestParam String uid, String name, String breed, String age, String height, String weight, String dogpicture, String description, String gender) {
        User u = userRepository.findByUid(uid);
        Dog d = new Dog(name, breed, age, height, weight, description, dogpicture, gender);
       
        u.setOwnedDog(d);
        
        userRepository.save(u);
        Long id = d.getId();
        dogRepo.save(d);
        return id.toString();
    }

    @PostMapping(value="/update")
    public @ResponseBody String update(@RequestParam String uid, String name, String email, String phone){
        User u = userRepository.findByUid(uid);
        if(u != null){
            u.setName(name);
            u.setEmail(email);
            u.setPhoneNumber(phone);
            userRepository.save(u);
            return "Updated";
        }
        else {
            return "no user found";
        }
        

    }

     @PostMapping(value="/updatename")
     public @ResponseBody boolean newNameForUser(@RequestBody String uid, String newName) {
            User u = userRepository.findByUid(uid);
            if(u != null){
                u.setName(newName);
                return true;
            }else{
                return false;
            }
     }

     @PostMapping(value="/updatephonenumber")
     public @ResponseBody boolean newPhoneNumberForUser(@RequestBody String uid, String newPhone ) {
            User u = userRepository.findByUid(uid);
            if(u != null){
                u.setPhoneNumber(newPhone);
                return true;
            }else{
                return false;
            }
     }

     @PostMapping(value="/updateemail")
     public @ResponseBody boolean newEmailForUser(@RequestBody String uid, String newEmail ) {
            User u = userRepository.findByUid(uid);
            if(u != null){
                u.setEmail(newEmail);
                return true;
            }else{
                return false;
            }
            
         
     }


     @DeleteMapping(value = "/deleteuser")
     public @ResponseBody boolean deleteUser(@RequestBody String uid) {
            User u = userRepository.findByUid(uid);
            if(u != null){
                userRepository.delete(u);
                return true;
            }else{
                return false;
            }
            
    }    
    
    }

