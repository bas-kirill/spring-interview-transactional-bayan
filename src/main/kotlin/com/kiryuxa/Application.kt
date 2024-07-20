package com.kiryuxa

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.context.annotation.Bean
import org.springframework.transaction.annotation.EnableTransactionManagement

@EnableTransactionManagement
@SpringBootApplication
class Application {

    @Bean
    fun clientService(): ClientService {
        return ClientServiceImpl()
    }

}

fun main(args: Array<String>) {
    val ctx = SpringApplication.run(Application::class.java, *args)
    val clientService = ctx.getBean(ClientService::class.java)

    clientService.foo()

    System.`in`.read()
}
