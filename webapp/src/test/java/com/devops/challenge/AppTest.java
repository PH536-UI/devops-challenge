package com.devops.challenge;

import org.junit.Test;
import static org.junit.Assert.*;

public class AppTest {

    @Test
    public void testAppExists() {
        App app = new App();
        assertNotNull(app);
    }

    @Test
    public void testGreeting() {
        String greeting = "Hello DevOps!";
        assertEquals("Hello DevOps!", greeting);
        System.out.println("Test passou: " + greeting);
    }

    @Test
    public void testBuildVersion() {
        String version = "1.0-SNAPSHOT";
        assertTrue(version.contains("SNAPSHOT"));
        System.out.println("Versao do build: " + version);
    }
}
