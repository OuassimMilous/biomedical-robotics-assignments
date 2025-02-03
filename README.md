# Biomedical Robotics Assignments

## Overview
This repository contains assignments related to biomedical robotics, including EMG signal processing, cursor control using EMG, and Phantom Omni Robot simulations. The assignments cover MATLAB and Simulink implementations for biomedical applications.

## Repository Structure
```
biomedical-robotics-assignments/
│-- first/
│   ├── es1_emg/  # EMG Signal Processing
│   │   ├── ES1_EMG_readme.docx
│   │   ├── ES1_emg.mat
│   │   ├── main.m
│   ├── es2_emg/  # EMG-Based Cursor Control
│   │   ├── ES2_EMG_readme.docx
│   │   ├── ES2_emg.mat
│   │   ├── exo2.m
│   │   ├── exo2_Part1_y.slx
│   │   ├── exo2_Part2_y.slx
│   │   ├── exo2_Part3_y.slx
│   │   ├── 8_palline_color.wrl
│   │   ├── Exercise2_Report.pdf
│-- second/
│   ├── Targeted muscle and sensory reinnervation.pdf
│-- third/
│   ├── Reaching_real.slx  # Reaching task on the robot
│   ├── Reaching_sim.slx   # Reaching task simulation using mouse
│   ├── forceFeilds_reaching.slx  # Force field + reaching task
│   ├── forceFeilds_sim.slx  # Force field sensing only
│   ├── VR_centerAndTarget.wrl
│   ├── 8_palline_color.wrl
│   ├── slprj/
```

## Assignments Breakdown
### 1. EMG Processing (first/es1_emg)
**Goal:** Preprocess and analyze EMG signals.
- Apply filtering.
- Rectify and compute the envelope of the signal.
- Downsample the signal.
- MATLAB script generates figures overlaying raw and processed signals.

### 2. EMG-Based Cursor Control (first/es2_emg)
**Goal:** Control a cursor on the screen using EMG signals.
- Process EMG signals and map them to cursor movement.
- Reach targets using predefined muscle activation thresholds.
- Implement and analyze alternative mapping strategies.


### 3. Phantom Omni Robot Simulations (third/)
**Reaching Task:**
- Simulink model to control the Phantom Omni robot.
- Cursor moves toward eight equidistant targets.
- Targets appear in random order, requiring iterative reaching movements.

**Force Field Experiments:**
- Simulate force field interactions in reaching movements.
- Implement an impedance controller defining a 3x3 force field matrix.
- Analyze different force field effects (attractive, repulsive, and viscous fields).

## Contributors
- Ouassim Milous
- Younes Hebik
- Josue Tinoco
- Abdelkader Temer


