using System;
using System.ComponentModel.DataAnnotations;

namespace Portfolio.Models
{
    public class OnlineJudge
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Judge Name is required")]
        [StringLength(100, ErrorMessage = "Judge Name cannot exceed 100 characters")]
        public string JudgeName { get; set; }

        [Required(ErrorMessage = "Profile Link is required")]
        [Url(ErrorMessage = "Please enter a valid URL")]
        [StringLength(500, ErrorMessage = "Profile Link cannot exceed 500 characters")]
        public string ProfileLink { get; set; }

        [Required(ErrorMessage = "Solve Count is required")]
        [Range(0, int.MaxValue, ErrorMessage = "Solve Count must be a positive number")]
        public int SolveCount { get; set; }

        [Required(ErrorMessage = "Display status is required")]
        public bool Display { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}