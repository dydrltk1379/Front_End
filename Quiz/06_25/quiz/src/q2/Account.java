package q2;

public class Account {
    String count;
    String name;
    int money;
    private static Account[] accounts = new Account[3];
    private static int cnt = 0;

    public Account() {
    }

    public Account(String count, String name, int money) {
        this.count = count;
        this.name = name;
        this.money = money;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public static int getCnt() {
        return cnt;
    }

    public static void setCnt(int cnt) {
        Account.cnt = cnt;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append(count).append("   ");
        sb.append(name).append("   ");
        sb.append(money);
        return sb.toString();
    }
}
