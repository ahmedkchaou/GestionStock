package com.mvc.stock.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.stock.mvc.entites.Client;
import com.stock.mvc.entites.Utilisateur;
import com.stock.mvc.services.IUtilisateurService;


@Controller
@RequestMapping(value = "/users")
public class UsersController {
	
	@Autowired
	private IUtilisateurService usersService;
	
	@RequestMapping(value = "/")
	public String users(Model model) {
		List<Utilisateur> utilisateurs = usersService.selectAll();
		if (utilisateurs == null) {
			utilisateurs = new ArrayList<Utilisateur>();
		}
		model.addAttribute("utilisateurs", utilisateurs);
		return "users/users";
	}

	@RequestMapping(value = "/ajoutUser", method = RequestMethod.GET)
	public String ajoutClient(Model model) {

		Utilisateur utilisateurs = new Utilisateur();
		model.addAttribute("utilisateurs", utilisateurs);

		return "users/ajoutUser";
	}
	
	@RequestMapping(value = "/enregistrer")
	public String enregistrerUtilisateur(Model model, Utilisateur utilisateur) {

		if (utilisateur.getIdUtilisateur() != null) {
			usersService.update(utilisateur);
		} else {
			usersService.save(utilisateur);
		}

		return "redirect:/users/";

	}
	
	@RequestMapping(value = "/modifier/{idUtilisateur}")
	public String enregistrerClient(Model model, @PathVariable Long idUtilisateur) {
		
		if(idUtilisateur != null) {
			Utilisateur utilisateur =  usersService.getById(idUtilisateur);
				
			if (utilisateur != null) {
				model.addAttribute("utilisateurs", utilisateur);	
			}
		}
		return "users/ajoutUser";
		
	}
	
	@RequestMapping(value = "/supprimer/{idUtilisateur}")
	public String removeClient(Model model, @PathVariable Long idUtilisateur) {
		
		if(idUtilisateur != null) {
			Utilisateur utilisateur =  usersService.getById(idUtilisateur);
				
			if (utilisateur != null) {
				usersService.remove(idUtilisateur);	
			}
		}
		return "redirect:/users/";
		
	}
}
