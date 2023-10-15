import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String size_r = request.getParameter("size_r");
        String x_coords = request.getParameter("x_coords");
        String y_coords = request.getParameter("y_coords");
        float x, y, r;
        try {
            x = Float.parseFloat(x_coords.replace(",", "."));
            y = Float.parseFloat(y_coords.replace(",", "."));
            r = Float.parseFloat(size_r.replace(",", "."));
        } catch (Exception e) {
            response.setStatus(400);
            response.getWriter().print("x, y, r - must be float float ");
            return;
        }

        if (!(x > -3.0f) || !(x < 5.0f)) {
            response.setStatus(400);
            response.getWriter().println("x must be in (-3; 5)");
        }

        if (!(y > -5.0f) || !(y < 3.0f)) {
            response.setStatus(400);
            response.getWriter().println("y must be in (-5; 3)");
        }

        if (!List.of(1f, 1.5f, 2f, 2.5f, 3f).contains(r)) {
            response.setStatus(400);
            response.getWriter().print("r must be one of [1, 1.5, 2, 2.5, 3]");
        }

        if (response.getStatus() != 400) {
            LocalDateTime attemptTime = LocalDateTime.now();
            long scriptStartTime = System.nanoTime();
            String isHit = this.checkHit(x, y, r) ? "Hit" : "Miss";
            long scriptEndTime = System.nanoTime();
            long scriptDuration = (scriptEndTime - scriptStartTime);
            response.getWriter().print(
                    "<tr>" +
                            "<td><p class='crop'>" + x + "</p></td>" +
                            "<td><p class='crop'>" + y + "</p></td>" +
                            "<td><p class='crop'>" + r + "</p></td>" +
                            "<td><p class='crop'>" + isHit + "</p></td>" +
                            "<td><p class='crop'>" + attemptTime + "</p></td>" +
                            "<td><p class='crop'>" + scriptDuration + "ms </p></td>" +
                    "</tr>"
            );
        }
    }

    private boolean checkHit(float x, float y, float r) {
        return (x <= 0 && y <= 0 && Math.pow((r / 2), 2) - Math.pow(x, 2) - Math.pow(y, 2) >= 0) || (x <= 0 && y >= 0 && x >= -r && y <= r / 2) || (x >= 0 && y <= 0 && x <= r && y >= x / 2 - r / 2);
    }
}
