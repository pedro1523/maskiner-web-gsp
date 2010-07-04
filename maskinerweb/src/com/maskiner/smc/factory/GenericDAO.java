package com.maskiner.smc.factory;

import javax.persistence.EntityManager;

public interface GenericDAO {

  public EntityManager getEntityManager();
  
}
