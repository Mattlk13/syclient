package ca.thundersun;

import org.jumpmind.symmetric.SymmetricWebServer;

public class StartSymmetricEngine {

    public static SymmetricWebServer node;

    public static void main(String[] args) throws Exception {
        StartSymmetricEngine engine = new StartSymmetricEngine ();

        engine.startNode();



    }

    void startNode() throws Exception {
        node = new SymmetricWebServer("classpath://conf/master.properties", "conf/web_dir");

        // this will create the database, sync triggers, start jobs running
        node.start(8091);
    }

    void stopNode() throws Exception {
        // this will stop the node
        node.stop();
    }


}

