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
import com.stock.mvc.services.IClientService;

@Controller
@RequestMapping(value = "/client")
public class ClientController {

	@Autowired
	private IClientService clientService;

	@RequestMapping(value = "/")
	public String client(Model model) {
		List<Client> clients = clientService.selectAll();
		if (clients == null) {
			clients = new ArrayList<Client>();
		}
		model.addAttribute("clients", clients);
		return "client/client";
	}

	@RequestMapping(value = "/ajoutClient", method = RequestMethod.GET)
	public String ajoutClient(Model model) {

		Client client = new Client();
		model.addAttribute("client", client);

		return "client/ajoutClient";
	}

	@RequestMapping(value = "/enregistrer")
	public String enregistrerClient(Model model, Client client) {

		if (client.getIdClient() != null) {
			clientService.update(client);
		} else {
			clientService.save(client);
		}

		return "redirect:/client/";

	}
	
	@RequestMapping(value = "/modifier/{idClient}")
	public String enregistrerClient(Model model, @PathVariable Long idClient) {
		
		if(idClient != null) {
			Client client =  clientService.getById(idClient);
				
			if (client != null) {
				model.addAttribute("client", client);	
			}
		}
		return "client/ajoutClient";
		
	}
	
	@RequestMapping(value = "/supprimer/{idClient}")
	public String removeClient(Model model, @PathVariable Long idClient) {
		
		if(idClient != null) {
			Client client =  clientService.getById(idClient);
				
			if (client != null) {
				clientService.remove(idClient);	
			}
		}
		return "redirect:/client/";
		
	}

}
