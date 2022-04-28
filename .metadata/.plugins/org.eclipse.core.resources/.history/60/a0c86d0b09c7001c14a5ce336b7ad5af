package tw.hibernatedemo.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

//單例設計模式
//因為很耗資源 所以統一控制
//在DemoDepartmentActionEx2
public class HibernateUtils {

	private static final SessionFactory factory = createSessionFactory();

	public HibernateUtils() {
	}

	private static SessionFactory createSessionFactory() {
		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
		SessionFactory factory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
		return factory;
	}

	public static SessionFactory getSessionFacotry() {
		return factory;
	}

	public static void closeSessionFactory() {
		if (factory != null) {
			factory.close();
		}
	}

}
