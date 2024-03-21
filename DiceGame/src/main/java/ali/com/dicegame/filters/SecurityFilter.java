package ali.com.dicegame.filters;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import java.io.IOException;

public class SecurityFilter {
    /** la vue d'authentification */
    private static final String CONNEXION_PAGE = "/WEB-INF/view/pages/login.jsp";

    private final Logger LOGGER;

    public SecurityFilter() {
        LOGGER = Logger.getLogger(SecurityFilter.class);
    }



    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {



        HttpServletRequest rq = (HttpServletRequest) request;

        HttpSession session = rq.getSession();

        if (session.getAttribute("user") == null) {

            rq.getRequestDispatcher(CONNEXION_PAGE).forward(request, response);

            return;

        } else {

            chain.doFilter(request, response);

        }

    }
}
