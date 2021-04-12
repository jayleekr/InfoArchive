#include <vector>   // std::vector
#include <memory>   // std::unique_ptr, std::make_unique
#include <utility>  // std::move
int main(){
    std::unique_ptr<std::vector<int>> vectorUniquePtr = std::make_unique<std::vector<int>>(3);

    
}