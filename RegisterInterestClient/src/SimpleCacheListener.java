import java.util.Properties;

import org.apache.geode.cache.Declarable;
import org.apache.geode.cache.EntryEvent;
import org.apache.geode.cache.util.CacheListenerAdapter;

public class SimpleCacheListener<K, V> extends CacheListenerAdapter<K, V> implements Declarable {
  @Override
  public void afterCreate(EntryEvent<K, V> e) {
    System.out.println("    Received afterCreate event for entry: " + e.getKey() + ", " + e.getNewValue());
  }

  @Override
  public void afterUpdate(EntryEvent<K, V> e) {
    System.out.println("    Received afterUpdate event for entry: " + e.getKey() + ", " + e.getNewValue());
    //System.out.println("    Received afterUpdate event for entry");
  }

  @Override
  public void afterDestroy(EntryEvent<K, V> e) {
    System.out.println("    Received afterDestroy event for entry: " + e.getKey());
  }

  @Override
  public void afterInvalidate(EntryEvent<K, V> e) {
    System.out.println("    Received afterInvalidate event for entry: " + e.getKey());
  }
}
