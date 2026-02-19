package dao;

public class Leave {
    private int id;
    private String name;
    private String fromDate;
    private String toDate;
    private String reason;
    private String status;

    public Leave(int id, String name, String fromDate, String toDate, String reason, String status) {
        this.id = id;
        this.name = name;
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.reason = reason;
        this.status = status;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getFromDate() { return fromDate; }
    public String getToDate() { return toDate; }
    public String getReason() { return reason; }
    public String getStatus() { return status; }
}
