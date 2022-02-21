package com.example;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

//@EnableAutoConfiguration(exclude=(DataSourceAutoConfiguration.class))
@SpringBootApplication
public class SpringExampleProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringExampleProjectApplication.class, args);
	}

	

}
