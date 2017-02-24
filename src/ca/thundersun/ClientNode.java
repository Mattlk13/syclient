package ca.thundersun;

import org.jumpmind.symmetric.ClientSymmetricEngine;
import org.jumpmind.symmetric.SymmetricWebServer;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

// From
// http://stackoverflow.com/questions/34069278/create-sym-tables-in-symmetricds-embedded

public class ClientNode {
    private ClientSymmetricEngine cEngine;
    private File propFile;

    public static void main(String[] args) {

        try {
            new ClientNode(new File("conf/client.properties"));
            SymmetricWebServer node = new SymmetricWebServer("master.properties");
            //node = new SymmetricWebServer("classpath://conf/master.properties", "conf/web_dir");

            node.setWebAppDir("Web");
            node.setJoin(false);
            node.start();
            // this will stop the node
            Thread.sleep(1000);
            node.stop();
        }catch (Exception e) {
            e.printStackTrace();
        }

    }


    public ClientNode(File file) throws FileNotFoundException, IOException {
        propFile = file;
        Properties propertiesFile = new Properties();
        propertiesFile.load(new FileReader(propFile));
        cEngine = new ClientSymmetricEngine(propertiesFile, true);
        getcEngine().setup();
        getcEngine().openRegistration("client", "002");// client is the name of the node group and 001 is the ID
        getcEngine().start();
    }

    public ClientSymmetricEngine getcEngine() {
        return cEngine;
    }

    public void setcEngine(ClientSymmetricEngine cEngine) {
        this.cEngine = cEngine;
    }
}