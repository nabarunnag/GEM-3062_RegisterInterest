import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.geode.cache.InterestResultPolicy;
import org.apache.geode.cache.Region;
import org.apache.geode.cache.client.ClientCache;
import org.apache.geode.cache.client.ClientCacheFactory;
import org.apache.geode.cache.client.ClientRegionShortcut;

public class ClientWorker {
  private static final String
      clientXML =
      "/home/nabarun/Development/GEM-3062_RegisterInterest/cacheXML/client.xml";
  public static void main(String[] args) throws IOException {
    System.out.println("Connecting to the distributed system and creating the client cache.");

    ClientCache clientCache = new ClientCacheFactory()
        .addPoolLocator("localhost", 10334)
        .set("cache-xml-file", clientXML)
        .set("log-level", "config")
        .set("log-file", "producer.log")
        .create();
    Region<String, String> region = clientCache.getRegion("People");
    region.registerInterestForAllKeys(InterestResultPolicy.KEYS);

    System.out.println("Press enter to continue");
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    br.readLine();

  }

}
