import java.util.*;

public class Main {
    static Scanner scanner = new Scanner(System.in);
    public static void main(String[] args) {
        int n = scanner.nextInt();
        List<String> paths = new ArrayList<>();
        for(int i = 0; i <= n; ++i){
            paths.add(scanner.nextLine());
        }

        printDirectories(paths);
    }

    public static void printDirectories(List<String> paths) {
        Map<String, Map<String, Object>> directoryStructure = new TreeMap<>();

        for (String path : paths) {
            String[] components = path.split("/");
            Map<String, Map<String, Object>> currentLevel = directoryStructure;

            for (int i = 1; i < components.length; i++) {
                if (!currentLevel.containsKey(components[i])) {
                    currentLevel.put(components[i], new TreeMap<>());
                }
            }
        }

        printDirectory(directoryStructure, 0);
    }

    public static void printDirectory(Map<String, ?> directory, int depth) {
        for (Map.Entry<String, ?> entry : directory.entrySet()) {
            System.out.print("  ".repeat(depth));
            System.out.println(entry.getKey());
            if (entry.getValue() instanceof Map) {
                printDirectory((Map<String, ?>) entry.getValue(), depth + 1);
            }
        }
    }
}
