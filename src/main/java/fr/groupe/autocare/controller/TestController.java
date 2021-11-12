package fr.groupe.autocare.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@CrossOrigin
public class TestController {
	public TestController() {
		// TODO Auto-generated constructor stub
	}
	
	@GetMapping("test")
	public ResponseEntity<?> methodeTest() {
		return ResponseEntity.ok("Tout fonctionne");
	}
}
