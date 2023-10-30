import java.time.LocalDateTime;

public class Result {
    public float x, y, r;
    public String isHit;
    public LocalDateTime attemptTime;
    public long scriptDuration;

    public Result(float x, float y, float r, String isHit, LocalDateTime attemptTime, long scriptDuration) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.isHit = isHit;
        this.attemptTime = attemptTime;
        this.scriptDuration = scriptDuration;
    }
}
