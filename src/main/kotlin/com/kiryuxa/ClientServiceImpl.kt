package com.kiryuxa

import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.transaction.annotation.Propagation
import org.springframework.transaction.annotation.Transactional

// how many transactions will be allocated?
open class ClientServiceImpl : ClientService {

    @Transactional(propagation = Propagation.REQUIRED)
    override fun foo() {
        logger.debug("Inside foo(): before calling bar()")
        bar()
        logger.debug("Inside foo(): bar() was called")
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    override fun bar() {
        logger.debug("Inside bar()")
    }

    companion object {
        val logger: Logger = LoggerFactory.getLogger(ClientServiceImpl::class.java)
    }
}