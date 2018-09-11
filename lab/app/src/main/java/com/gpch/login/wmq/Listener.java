/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gpch.login.wmq;

/**
 *
 * @author victor
 */
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.messaging.Message;
import org.springframework.stereotype.Component;

@Component
public class Listener {

    private final Logger LOG = LoggerFactory.getLogger(Listener.class);

    @JmsListener(destination = "${ibm.mq.queue.receiver}", containerFactory = "myFactory")
    public void receiveMessage(Message<String> message) {
        LOG.info("Received message <" + message.getPayload() + ">");
    }
    
}
