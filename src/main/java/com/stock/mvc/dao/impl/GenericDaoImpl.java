package com.stock.mvc.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.stock.mvc.dao.IGenericDao;

@SuppressWarnings("unchecked")
public class GenericDaoImpl<E> implements IGenericDao<E> {

	@PersistenceContext
	EntityManager em;
	
	private Class<E> type;
	
	public Class<E> getType() {
		return type;
	}

	public GenericDaoImpl() {
		Type t = getClass().getGenericSuperclass();
		ParameterizedType pt = (ParameterizedType) t;
		type = (Class<E>) pt.getActualTypeArguments()[0];
	}
	
	@Override
	public E save(E entity) {
		
		 em.persist(entity);
		 return entity;
	}

	@Override
	public E update(E entity) {
		
		 em.merge(entity);	
		 return entity;
	}

	
	@Override
	public List<E> selectAll() {
			
		Query query= em.createQuery("select t from "+ type.getSimpleName() + " t");
		return query.getResultList();
	}

	
	@Override
	public List<E> selectAll(String sortField, String sort) {
		
		Query query= em.createQuery("select t from "+ type.getSimpleName() + " t order by "+ sortField + " "+sort);
		return query.getResultList();
			
	}
	
	@Override
	public List<E> selectAllJoin() {
		
		//Query query= em.createQuery("SELECT u.nom,u.prenom,u.mail,u.motDePasse,u.actived,r.roleName FROM utilisateur u, roles r where u.idUtilisateur=r.idUtilisateur");
		
		Query query=em.createQuery("SELECT t FROM "+ type.getSimpleName() + " t INNER JOIN t.roles r");

		return query.getResultList();			
	}
	
	/*
	 * (non-Javadoc)
	 * @see com.stock.mvc.dao.IGenericDao#getById(java.lang.Long)
	 * 
	 * List<Object[]> results = em.createQuery("SELECT p.firstName, p.lastName, n.phoneNumber FROM Person p JOIN PhoneBookEntry n ON p.firstName = n.firstName AND p.lastName = n.lastName").getResultList();

	 */

	@Override
	public E getById(Long id) {

		return em.find(type, id);
	}

	@Override
	public void remove(Long id) {

		E tab = em.getReference(type, id);
		em.remove(tab);
		
	}

	@Override
	public E findOne(String paramName, Object paramValue) {
		
		Query query = em.createQuery("select t from " + type.getSimpleName() + " t where " + paramName + " = :x");
		query.setParameter("x", paramValue);
		return query.getResultList().size() > 0 ? (E) query.getResultList().get(0) : null;

	}

	@Override
	public E findOne(String[] paramNames, Object[] paramValues) {
		
		if (paramNames.length != paramValues.length) {
			return null;
		}
		String queryString = "select e from " + type.getSimpleName() + " e where ";
		int len = paramNames.length;
		for (int i = 0; i < len; i++) {
			queryString += " e." + paramNames[i] + "= :x" + i;
			if ((i + 1) < len) {
				queryString += " and ";
			}
		}
		Query query = em.createQuery(queryString);
		for (int i = 0; i < paramValues.length; i++) {
			query.setParameter("x" + i, paramValues[i]);
		}
		return query.getResultList().size() > 0 ? (E) query.getResultList().get(0) : null;

	}

	@Override
	public int findCountBy(String paramName, String paramValue) {

		Query query = em.createQuery("select t from " + type.getSimpleName() + " t where " + paramName + " = :x");
		query.setParameter(paramName, paramValue);
		return query.getResultList().size() > 0 ? ((Long) query.getSingleResult()).intValue() : 0;

	}

}
