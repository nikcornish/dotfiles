# Functions

# Find the path to a file by name, searching from the current directory
findPath() {
  find . -name "$1" 2>/dev/null
}
