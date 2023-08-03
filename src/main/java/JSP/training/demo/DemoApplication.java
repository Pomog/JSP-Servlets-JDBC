package JSP.training.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class DemoApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(DemoApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

	@Bean
	public ServletRegistrationBean<HelloWorldServlet> servletRegistrationBean() {
		ServletRegistrationBean<HelloWorldServlet> bean = new ServletRegistrationBean<>(new HelloWorldServlet(), "/hello");
		bean.setLoadOnStartup(1);
		return bean;
	}

	@Bean
	public ServletRegistrationBean<StudentServlet> servletRegistrationBean2() {
		ServletRegistrationBean<StudentServlet> bean = new ServletRegistrationBean<>(new StudentServlet(), "/StudentServlet");
		bean.setLoadOnStartup(1);
		return bean;
	}

	@Bean
	public ServletRegistrationBean<TestParametersServlet> servletRegistrationBean3() {
		var bean = new ServletRegistrationBean<>(new TestParametersServlet(), "/TestParametersServlet");
		bean.setLoadOnStartup(1);
		return bean;
	}

	@Bean
	public ServletRegistrationBean<MVCServletController> servletRegistrationBean4() {
		var bean = new ServletRegistrationBean<>(new MVCServletController(), "/MVCServletController");
		bean.setLoadOnStartup(1);
		return bean;
	}

}
