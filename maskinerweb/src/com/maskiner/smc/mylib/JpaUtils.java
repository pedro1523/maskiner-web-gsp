package com.maskiner.smc.mylib;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {

  private static final String JPA_UNIT_NAME = "jpa-maskiner";
  private static EntityManagerFactory factory;
  
  public static EntityManagerFactory getFactory() {
    if (factory == null) {
      factory = Persistence.createEntityManagerFactory(JPA_UNIT_NAME);
    }
    return factory;
  }
  
}
