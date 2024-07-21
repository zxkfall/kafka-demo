package com.flywinter.kafkademo;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class KafkaConsumer {

    @KafkaListener(topics = "my_topic_3", groupId = "my-group")
    public void consume(Object message) {
        System.out.println("=============================");
        System.out.println("Consumed message: " + message);
    }
}
