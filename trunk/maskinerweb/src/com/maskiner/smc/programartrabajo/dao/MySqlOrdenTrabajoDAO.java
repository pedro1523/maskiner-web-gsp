package com.maskiner.smc.programartrabajo.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import com.maskiner.smc.mylib.MySqlDbConn;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoBean;
import com.maskiner.smc.programartrabajo.bean.OrdenTrabajoInspeccionBean;
import com.maskiner.smc.programartrabajo.bean.PaqueteXOTBean;
import com.maskiner.smc.programartrabajo.bean.TecnicoBean;

public class MySqlOrdenTrabajoDAO implements OrdenTrabajoDAO {

	@Override
	public void generarOrdenTrabajo(OrdenTrabajoBean ordenTrabajo)
			throws Exception {

		Connection cn = null;
		
		try {
			cn = MySqlDbConn.obtenerConexion();
			cn.setAutoCommit(false);
			//paso1: obtener nuevo número de O/T
			String strNuevoNumOT = null;
			CallableStatement st, st1, st2;
			st = cn.prepareCall("{ call pr_nuevoNumeroOrdenTrabajo() }");
			ResultSet rs = st.executeQuery();
			if(rs.next())
				strNuevoNumOT = rs.getString(1);
			else
				throw new Exception("No se puede obtener un nuevo número para la orden de trabajo");
			
			/*paso2: insertar la orden de trabajo en estado pendiente (1)
			 *       actualiza el estado de la avería en la tabla maquinariasucursal_x_incidente a Por reparar (3)
			 *       si es la última orden de trabajo generada del incidente, establecer el valor del incidente a atendido (4)
			 * */
			
			st = cn.prepareCall("{ call pr_nuevaOrdenTrabajo(?,?,?,?,?,?) }");
			st.setString(1, strNuevoNumOT);
			st.setDate(2, ordenTrabajo.getDtFechaOrdenTrabajo());
			st.setString(3, ordenTrabajo.getStrCodRegistrador());
			st.setString(4, ordenTrabajo.getStrNumIncidente());
			st.setString(5, ordenTrabajo.getStrNumTarjeta());
			st.setInt(6, ordenTrabajo.getIntItmAveria());
			
			st.execute();
			
			//paso3: insertar en paquete_x_ot todos los paquetes definidos
			
			st  = cn.prepareCall("{ call pr_insertarPaqueteXOT(?,?,?,?,?) }");
			st1 = cn.prepareCall("{ call pr_insertarTecnicosEnPaqueteXOT(?,?,?) }");
			st2 = cn.prepareCall("{ call pr_cambiarDisponibilidadTecnicoANoDisponible(?,?,?,?) }");
			for(PaqueteXOTBean pqot: ordenTrabajo.getArrPaquetesXOT()){
				st.setString(1, pqot.getStrCodPaquete());
				st.setString(2, strNuevoNumOT);
				st.setDate(3, pqot.getDtFechEjecOrdenTrabajo());
				st.setTime(4, pqot.getTmHoraInicio());
				st.setTime(5, pqot.getTmHoraFin());
				st.execute();
				//paso4: insertar en tecnico_x_paquete_x_ot todos los tecnicos asignados
				for(TecnicoBean tcpqot: pqot.getArrTecnicosAsignados()){
					st1.setString(1, tcpqot.getStrCodTecnico());
					st1.setString(2, pqot.getStrCodPaquete());
					st1.setString(3, strNuevoNumOT);
					st1.execute();
					//paso5: modificar el estado de la disponibilidad  de los técnicos a No Disponible (2)
					st2.setString(1, tcpqot.getStrCodTecnico());
					st2.setDate(2, pqot.getDtFechEjecOrdenTrabajo());
					st2.setTime(3, pqot.getTmHoraInicio());
					st2.setTime(4, pqot.getTmHoraFin());
					st2.execute();		
				}
			}
			
			//paso6: establecer en el bean ordenTrabajo la propiedad num_ord_trab y est_ord_trab en los valores actualizados
				ordenTrabajo.setStrNumOrdenTrabajo(strNuevoNumOT);
				ordenTrabajo.setIntEstadoOrdenTrabajo(1);
			
			//paso7: confirmar cambios
			cn.commit();

		} catch (Exception e) {
			e.printStackTrace();
			cn.rollback();
			throw new Exception(e.getMessage(),e);
		}
	}
	
	/*========================CHRISTIAN===========*/
	public boolean registrarOrdenTrabajoInspeccion( OrdenTrabajoInspeccionBean OTIbean) throws Exception{
			
			Connection cn=MySqlDbConn.obtenerConexion();
			CallableStatement st=  cn.prepareCall("{ call pr_insertarOrdenTrabajoInspeccion(?,?,?,?,?,?,?,?) }");
			st.setString(1, OTIbean.getStrFecInspeccion());
			st.setString(2, OTIbean.getStrHorInicio());
			st.setString(3, OTIbean.getStrHorFin());
			st.setString(4,OTIbean.getStrCodRegistrador());
			st.setString(5,OTIbean.getStrCodTecnico());
			st.setString(6,OTIbean.getStrNumIncidente());
			st.setString(7,OTIbean.getStrNumTarjeta());
			st.setInt(8, OTIbean.getIntItemAveria());		
			if(st.executeUpdate()<0){			
				return false;
				}
			System.out.println("REGISTRO EXITOSISIMO MARAVILLOSO!!!!");
			return true;
		}
		/*====================FIN=================================*/

}
