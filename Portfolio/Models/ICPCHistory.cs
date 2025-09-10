using System;
using System.ComponentModel.DataAnnotations;

namespace Portfolio.Models
{
    public class ICPCHistory
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Contest Title is required")]
        [StringLength(200, ErrorMessage = "Contest Title cannot exceed 200 characters")]
        public string ContestTitle { get; set; }

        [Required(ErrorMessage = "Contest Date is required")]
        public DateTime ContestDate { get; set; }

        [Required(ErrorMessage = "Rank is required")]
        [Range(1, int.MaxValue, ErrorMessage = "Rank must be greater than 0")]
        public int Rank { get; set; }

        [Required(ErrorMessage = "Status is required")]
        [StringLength(100, ErrorMessage = "Status cannot exceed 100 characters")]
        public string Status { get; set; }

        [StringLength(500, ErrorMessage = "Contest URL cannot exceed 500 characters")]
        public string ContestURL { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}