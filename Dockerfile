# Start from the official Jenkins image (with UI)
FROM jenkins/jenkins:lts

# Switch to root to install Python
USER root

# Install Python and necessary dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-venv python3-pip python3-setuptools python3-wheel python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Create an alias for python3 as python
RUN ln -s /usr/bin/python3 /usr/bin/python

# Create and activate a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python packages
RUN pip install pytest pytest-cov requests setuptools pylint

# Set permissions for Jenkins user
RUN chown -R jenkins:jenkins /var/jenkins_home

# Switch back to Jenkins user
USER jenkins

# Expose Jenkins UI and agent ports
EXPOSE 8080 50000

# Start Jenkins
CMD ["jenkins.sh"]
