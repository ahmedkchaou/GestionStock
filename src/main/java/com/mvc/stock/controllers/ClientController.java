package com.mvc.stock.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);

	@RequestMapping(value = "/")
	public String client(Model model) {
		
		List<Client> clients = clientService.selectAll();
		if (clients == null) {
			clients = new ArrayList<Client>();
		}
	
				
		model.addAttribute("clients", clients);
		logger.info("Welcome home! The client test");
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
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setLenient(false);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

}
