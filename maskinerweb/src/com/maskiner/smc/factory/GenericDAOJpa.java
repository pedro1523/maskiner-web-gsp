package com.maskiner.smc.factory;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import com.maskiner.smc.mylib.JpaUtils;

public abstract class GenericDAOJpa implements GenericDAO {

  public EntityManager getEntityManager() {
    EntityManagerFactory factory = JpaUtils.getFactory();
    return factory.createEntityManager();
  }
  
}
