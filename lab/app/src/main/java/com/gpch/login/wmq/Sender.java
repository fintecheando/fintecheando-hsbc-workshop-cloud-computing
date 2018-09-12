/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gpch.login.wmq;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;


@Service
/**
 *
 * @author victor
 */
public class Sender {
    private final Logger LOG = LoggerFactory.getLogger(Sender.class);

    @Autowired
    private JmsMessagingTemplate jmsMessagingTemplate;

    @Value("${ibm.mq.queue.sender}")
    private String senderQueue;


    public void send(String body){
        LOG.info("Try to send message {}", body);
        Message<String> message = MessageBuilder.withPayload(body).build();
        //jmsMessagingTemplate.send("${ibm.mq.queue.sender}", message);

        // Send a message with a POJO - the template reuse the message converter
        System.out.println("Sending an email message.");
        jmsMessagingTemplate.convertAndSend(senderQueue, message);
   
        LOG.info("Message {} sended", body);
    }
    
}
