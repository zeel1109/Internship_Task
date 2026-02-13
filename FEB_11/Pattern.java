package FEB_11;

public class Pattern {
    public static void main(String[] args) {

        int n = 5;

        for (int i = n; i >= 1; i--) {

            for (int j = 1; j <= i; j++) {
                System.out.print(j);
            }

            for (int s = 1; s <= (n - i) * 2; s++) {
                System.out.print(" ");
            }

            for (int j = i; j >= 1; j--) {
                System.out.print(j);
            }

            System.out.println();
        }
    }
}

